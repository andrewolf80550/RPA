(define (problem prob_actividad_3) (:domain actividad3)
(:objects 
    l_1 l_2 l_3 l_4 -localizacion
    paci_1 paci_2 -paciente
    ambu - ambulancia
    hosp - hospital
)
(:init
    
    (lugar_hospital hosp l_1)
    (lugar_paciente paci_1 l_2)
    (lugar_paciente paci_2 l_4)
    (lugar_ambulancia ambu l_1)
    (ruta l_1 l_2)
    (ruta l_2 l_4)
    (ruta l_4 l_3)
    (ruta l_2 l_1)
    (ruta l_4 l_2)
    (ruta l_3 l_4)



)

(:goal (and
    
    (paciente_hospital hosp paci_2)
    (paciente_hospital hosp paci_1)   
    
))


)
