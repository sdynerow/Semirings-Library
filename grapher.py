graph = ximport("graph")

from Metarouting.Algebra.Matrix import *
from Metarouting.Policy.WidestShortest import *
from Metarouting.Policy.Shortest import *
from Metarouting.Algorithms.Dijkstra import *

#### Before defs ####

try:
    graph = ximport("graph")
except ImportError:
    graph = ximport("__init__")
    reload(graph)

class MetaroutingGraph(graph.graph):
    def __init__(self, G, nh, posX, posY, iterations=100, distance=5):
        graph.graph.__init__(self, iterations, distance)
        self.styles = graph.create().styles
        #self.styles.dark.align = CENTER

        self.events.click = self.click
        self.events.popup = False

        self.src = None
        self.dst = None
        self.hl = [[]]

        self.matrix = G
        self.nextHops = nh

        nRange = range(G.order())
        for i in nRange:
            n = self.add_node(i, label=str(i+1), radius=8, style="dark", root=False)
            n.x = posX[i]
            n.y = posY[i]

        for s in nRange:
            for d in nRange:
                if(self.matrix(s,d) != G.type.zero()):
                    self.add_edge(s,d, label=str(self.matrix(s,d)))

    def click(self, i):
        if(self.dst == None):
            # Disable src and activate dst
            self.dst = i
            self.dst.style = 'important'
            ph = list()
            c = 0
            n = self.matrix.order()
            while (c < n):
                ph.append(nh[c][self.dst.id])
                c += 1
            self.hl = ph
        else:
            self.dst.style = 'dark'
            self.dst = None
            self.hl = [[]]

    def draw(self):
        src = self.events.hovered
        if(self.dst == None):
            if(src != None):
                self.hl = nh[src.id]
            else:
                self.hl = [[]]
        graph.graph.draw(self, directed=True, highlight=self.hl)

#### After defs ####

sel = 1

identity = [
    Shortest.INF,
    WidestShortest.DINF,
    Shortest.INF         
]

I = identity[sel]

examples = [
    dict(n = 4,
         m = Matrix(4, 4, [I,1,2,4,
                           1,I,2,4,
                           2,2,I,1,
                           4,4,1,I], cast=Shortest),
         posX = [0, 80, 150, 0],
         posY = [0, 20, 150, 100]),
    dict(n = 5,
         m = Matrix(5, 5, [ (0, I), (5, 1), (0, I), (0, I), (0, I)
                          , (0, I), (0, I), (0, I), (0, I), (0, I)
                          , (0, I), (5, 4), (0, I), (5, 1), (0, I)
                          , (5, 1), (0, I), (0, I), (0, I), (10, 1)
                          , (10, 5), (0, I), (5, 1), (0, I), (0, I)], cast=WidestShortest),
        posX = [0, 0, 0, -100, 100],
        posY = [-100, 0, 70, 100, 100]),
    dict(n = 5,
         m = Matrix(5, 5, [ I, 1, I, I, I
                          , I, I, I, I, I
                          , I, 2, I, I, I
                          , 4, I, 1, I, 2
                          , -1, I, 1, I, I], cast=Shortest),
        posX = [0, 0, 0, -100, 100],
        posY = [-100, 0, 70, 100, 100])
]

n = examples[sel]['n']
m = examples[sel]['m']

i = 0
pi = list()
nh = list()
while (i < n):
    (piT, nhT) = dijkstraND(m, i)
    print "Dijkstra (ND) [s=" + str(i) + "]: pi: " + str(piT) + " nh: " + nhStr(nhT)
    pi.append(piT)
    nh.append(nhT)
    i += 1

# Graph-related

posX = examples[sel]['posX']
posY = examples[sel]['posY']

g = MetaroutingGraph(m, nh, posX, posY)

size(500, 500)
speed(30)

def draw():
    g.solve()
    g.draw()