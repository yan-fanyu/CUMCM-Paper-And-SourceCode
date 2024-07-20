import numpy as np

#marked_point 0-> start； 1-> village；2 -> mine; 3-> end
position = np.array((0,2,1,2,1,3))
# The distance between the marked position
distance=np.array(((0, 7, 8, 9, 9, 11),
                 (7, 0, 1, 3, 4, 4),
                 (8, 1, 0, 2, 3, 3),
                 (9, 3, 2, 0, 1, 2),
                 (9, 4, 3, 1, 0, 2),
                 (11, 4, 3, 2, 2, 0)))
# The relation between the marked position is found by graph theory by hand 
relation_position = np.array(((0, 1, 1, 1),  
                            (0, 0, 1, 1),
                            (0, 1, 0, 1),
                            (0, 0, 0, 0)))
#The weather in module 1 in 30 days
weather = np.array((2, 2, 1, 3, 1,  
                2, 3, 1, 2, 2,
                3, 2, 1, 2, 2,
                2, 3, 3, 2, 2,
                1, 1, 2, 1, 3,
                2, 1, 1, 2, 2))
#Weight&Price
weight_water=3
weight_food=2
price_water=5
price_food=10
#Consumption in different weather
consumption_water_weather=np.array((0, 5, 8, 10))
consumption_food_weather=np.array((0, 7, 6, 10))
#The number of terrain's type
n=6
#Original argument
capacity=1200
fund_basic=10000
income=1000
date=30
consumption_water=np.zeros((32,6,6))
consumption_food=np.zeros((32,6,6))
# How long does it take from i to j on day k
dayss = np.zeros((32, 6, 6)) 
fund=0
#Record the everyday information
activity_everyday=np.zeros(32)
position_everyday=np.zeros(32)
optimum_position = np.zeros(32)
optimum_activity = np.zeros(32)
optimum_origin_water=0
optimum_origin_food=0

#Use the algorithm of DFS. I learned it on GitHub!
def depth_first_search(days:int, now:int,weight:int, fund_now:int,water:int, food:int, type:int)->None:
    activity_everyday[days]=type
    position_everyday[days]=now
    global fund, optimum_origin_food, original_water

    #village
    if position[now]==1: 
        weight=capacity-water*weight_water-food*weight_food

    for i in range(n):
        if relation_position[position[now]][position[i]]:
            cost_food=consumption_food[days][now][i]
            cost_water=consumption_water[days][now][i]
            cost=fund_now
            weight_now=weight
            if food>=cost_food:
                food_now=food-cost_food
            else:
                food_now=0
                cost=cost-2*(cost_food-food)*price_food
                weight_now=weight_now-(cost_food-food)*weight_food
            if water>=cost_water:
                water_now=water-cost_water
            else:
                water_now=0
                cost=cost-2*(cost_water-water)*price_water
                weight_now=weight_now-(cost_water-water)*weight_water
            
            if np.any(weight_now<0) or np.any(cost<0):
                continue
            depth_first_search(days+dayss[days][now][i],i,weight_now,cost,water,food,0)

        #mine
    if position[now]==2:
        attday=days
        cost_food=consumption_water_weather[weather[attday]]
        cost_water=consumption_food_weather[weather[attday]]
        attday+=1
        if water>=cost_water:
            x=x-cost_water
            cost_water=0
        else:
            cost_water=cost_water-water
            water=0
        if food>=cost_food:
            food=food-cost_food
            cost_food=0
        else:
            cost_food=cost_food-food
            food=0
        weight=weight-cost_food*weight_food-cost_water*weight_water
        fund_now=fund_now-2*(cost_food*price_food+cost_water*price_water)
        if weight>=0 and fund>=0:
            depth_first_search(attday,now,weight,fund_now,water,food,1)

        attday=days
        cost_water=consumption_water_weather[weather[attday]]*2
        cost_food=consumption_food_weather[weather[attday]]*2
        attday+=1
        if water>=cost_water:
            x=x-cost_water
            cost_water=0
        else:
            cost_water=cost_water-water
            water=0
        if food>=cost_food:
            food=food-cost_food
            cost_food=0
        else:
            cost_food=cost_food-food
            food=0
        weight=weight-cost_food*weight_food-cost_water*weight_water
        fund_now=fund_now-2*(cost_food*price_food+cost_water*price_water)
        fund_now=fund_now+income
        if weight>=0 and fund>=0:
            depth_first_search(attday,now,weight,fund_now,water,food,2)

    if position[now]==3:
        if fund<=fund_now+water*price_water+food*price_food:
            optimum_origin_water=water
            optimum_origin_food=food
            fund=fund_now+water*price_water+water*price_food
            for i in range(date+1):
                optimum_position[i]=position_everyday[i]
                optimum_activity[i]=activity_everyday[i]
            activity_everyday[days]=-1
            position_everyday[days]=-1
            return
        
    if days>=date:
        activity_everyday[days]=-1
        position_everyday[days]=-1
        return
    

    activity_everyday[days]=-1
    position_everyday[days]=-1

#Magic function!
if __name__ =='__main__':
    for i in range(date+1):
        activity_everyday[i]=-1
        position_everyday[i]=-1

    for i in range(date+1):
        for j in range(n):
            for k in range(n):
                if relation_position[position[j]][position[k]]:
                    now, count, sumx, sumy = 0, 0, 0, 0
                    while count<distance[j][k]:
                        if now + i < len(weather):
                            if weather[now+i]!=3:
                                count+=1
                                sumx=sumx+2*consumption_water_weather[weather[now+i]]
                                sumy=sumy+2*consumption_food_weather[weather[now+i]]
                            else:
                                sumx=sumx+consumption_water_weather[weather[now+i]]
                                sumy=sumy+consumption_food_weather[weather[now+i]]
                        
                        now+=1
                        if now+i >=date:
                            break
                    if count <distance[j][k]:
                        sumx=xumy=20000
                        now=30
                    consumption_water[i][j][k]=sumx
                    consumption_food[i][j][k]=sumy
                    dayss[i][j][k]=now
        print(type(dayss[0,0,0]))

        dictionary={}
        for i in range(capacity+1):
            c2=i//weight_food
            c1=(capacity-i)//weight_water
            dictionary.setdefault((c1,c2),0)
            if not dictionary[(c1,c2)]:
                print((c1,c2))
                depth_first_search(0,0,0,fund_basic-c2*consumption_food-c1*consumption_water,c1,c2,-1)
            dictionary[(c1,c2)]=1
    print(fund)

                

                



            
            

    




