import numpy as np  
  
class Particle:  
    def __init__(self, dim, minx, maxx):  
        self.position = np.random.uniform(low=minx, high=maxx, size=dim)  
        self.velocity = np.random.uniform(low=-0.1, high=0.1, size=dim)  
        self.best_position = np.copy(self.position)  
        self.best_score = -np.inf  
  
class PSO:  
    def __init__(self, dim, n_particles, bounds):  
        self.dim = dim  
        self.n_particles = n_particles  
        self.bounds = bounds  
        self.particles = [Particle(dim, *bounds) for _ in range(n_particles)]  
          
    def optimize(self, func, n_iter):  
        global_best_score = -np.inf  
        global_best_position = None  
  
        for i in range(n_iter):  
            for particle in self.particles:  
                score = func(particle.position)  
  
                if score > particle.best_score:  
                    particle.best_score = score  
                    particle.best_position = particle.position  
  
                if score > global_best_score:  
                    global_best_score = score  
                    global_best_position = particle.position  
  
            for particle in self.particles:  
                particle.velocity += 2 * np.random.rand(self.dim) * (particle.best_position - particle.position) +  2 * np.random.rand(self.dim) * (global_best_position - particle.position)  
                particle.position += particle.velocity  
  
                for i in range(self.dim):  
                    if particle.position[i] < self.bounds[0]:  
                        particle.position[i] = self.bounds[0]  
                    elif particle.position[i] > self.bounds[1]:  
                        particle.position[i] = self.bounds[1]  
  
        return global_best_position  
def fitness(position):  
    total_length = np.sum(position)  
    missed_area_percentage = np.sum(data[position == 0]) / np.sum(data)  
    overlap_length = np.sum(position[position > 1] - 1)  
      
    # 希望最小化这三个指标  
    return -(total_length + missed_area_percentage + overlap_length)  
  
pso = PSO(dim=20, n_particles=30, bounds=(0, 1))  
best_position = pso.optimize(fitness, n_iter=1000)  
