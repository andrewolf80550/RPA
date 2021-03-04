;Header and description

(define (domain actividad3)

;remove requirements that are not needed
(:requirements :strips :typing :negative-preconditions)

(:types ;todo: enumerate types and their hierarchy here, e.g. car truck bus - vehicle
ambulancia paciente hospital localizacion - object
)

; un-comment following line if constants are needed
;(:constants )

(:predicates ;todo: define predicates here
    (ruta ?l1 - localizacion ?l2 - localizacion)
    (lugar_ambulancia ?ambu - ambulancia ?loc - localizacion)
    (lugar_paciente ?paci - paciente ?loc - localizacion)
    (lugar_hospital ?hosp - hospital ?loc - localizacion)
    (cargar_ambulancia ?ambu - ambulancia ?paci - paciente)
    (paciente_hospital ?hosp - hospital ?paci - paciente)

)
(:action mover_ambulancia
    :parameters (?ambu - ambulancia ?l1 - localizacion ?l2 - localizacion)
    :precondition (and
        (lugar_ambulancia ?ambu ?l1)
        (ruta ?l1 ?l2))
    :effect (and (lugar_ambulancia ?ambu ?l2) (not(lugar_ambulancia ?ambu ?l1)))
)

(:action subir_paciente
    :parameters (?ambu - ambulancia ?paci - paciente ?l1 - localizacion ?hosp - hospital)
    :precondition (and
        (lugar_ambulancia ?ambu ?l1)
        (lugar_paciente ?paci ?l1)
        (not(paciente_hospital ?hosp ?paci))
    )
    :effect (and 
        (cargar_ambulancia ?ambu ?paci) (not(lugar_paciente ?paci ?l1)))
)

(:action bajar_paciente
    :parameters (?ambu - ambulancia ?paci - paciente ?l1 - localizacion ?hosp - hospital)
    :precondition (and
        (cargar_ambulancia ?ambu ?paci)
        (lugar_ambulancia ?ambu ?l1)
        (lugar_hospital ?hosp ?l1))
    :effect (and 
        (not(cargar_ambulancia ?ambu ?paci))
        (paciente_hospital ?hosp ?paci)
        (lugar_paciente ?paci ?l1))
)
)
