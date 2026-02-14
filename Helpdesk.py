import mysql.connector
import bcrypt

maconnexion= mysql.connector.connect(
    host="localhost",
    user="root",
    password="adji",
    database="Helpdesk"
)
user_connecte=None

if maconnexion.is_connected():
    print(f"Connecte a {maconnexion.database}")

def Fonctionnalites_Admin():
    while True:
        Menu_admin()
        choix=input("Donnez votre choix")
        if choix=="1":
            print("Listes de tous les tickets")
            cursor=maconnexion.cursor()
            query="""Select * from Tickets """
            cursor.execute(query)
            maligne=cursor.fetchall()
            for ticket in maligne:
                id_ticket, titre, description, niveau, etat, id_user = ticket
                print(f"ID: {id_ticket}")
                print(f"Titre: {titre}")
                print(f"Description: {description}")
                print(f"Urgence: {niveau}")
                print(f"Etat: {etat}")
                print(f"Utilisateur: {id_user}")
                print("--------------------------------------------------")
            cursor.close()

        elif choix=="2":
            print("----------------------------Suivie Tickets---------------------")

            while True:

                id_tickets = input("Donnez l'identifiant du ticket a suivre: ")

                cursor = maconnexion.cursor()
                query = """Select * from Tickets where id_tickets=%s"""
                cursor.execute(query,(id_tickets,))
                maligne = cursor.fetchone()
                id_ticket, titre, description, niveau, etat, id_user = maligne
                if maligne is None:
                    print("l'id du ticket est invalide")
                else:
                    print(f"ID: {id_ticket}")
                    print(f"Titre: {titre}")
                    print(f"Description: {description}")
                    print(f"Niveau d'urgent: {niveau}")
                    print(f"Etat: {etat}")
                    print(f"Utilisateur: {id_user}")
                    print("-------------------------------------------------------------------------------------")

                    etat=input("nouvel etat: ")
                    cursor=maconnexion.cursor()
                    query = """update Tickets set etat= %s where id_tickets=%s"""
                    cursor.execute(query,(etat,id_tickets))
                    maconnexion.commit()
                    print("Etat Change avec succes")
                    print("----------------------------------------------------------------------------------------------------")
                    break
        elif choix=="3":
            Interface_User()
            break
        else:
            print("choix invalide")   


#===========================================================================================================================         

def Fonctionnalites_Apprenants():
    while True:
        Menu_apprenant()
        choix=input("Donnez votre choix")
        if choix=="1":
            print("Quel est l'objet de votre demande")
            while True:
                titre=input("Titre: ")
                if titre.replace(" ", "").isalpha() and len(titre)>=3:
                    break
                else:
                    print("Donne un bon titre") 
            while True:        
                description= input("Description: ")
                if description.replace(" ", "").replace("'", "").isalpha() and len(description)>=10:
                    break
                else:
                    print("Donne une bonne description de la demande")
            while True:        
                niveau= input("Niveau d'urgence: ")
                if niveau.replace(" ", "").isalpha() and len(niveau)>=5:
                    break
            global user_connecte
            id_user = user_connecte
        
            cursor=maconnexion.cursor()
            query="""Insert into Tickets(titre,description,niveau,id_user) values(%s,%s,%s,%s)"""   
            cursor.execute(query,(titre,description,niveau,id_user))
            maconnexion.commit()
            print(f"le ticket {titre} ajoute avec succes ")
            print("---------------------------------------------------------------")
            cursor.close()
                
        elif choix=="2":
            print("------------Etat des Demandes------------------------- ") 
            
            id_user = user_connecte

            cursor=maconnexion.cursor()
            query="""Select t.id_user, t.titre, t.etat, t.description from Tickets as t where id_user= %s """  
            cursor.execute(query,(id_user,))
            maligne=cursor.fetchall()
            for i in maligne:
                id_user, titre, etat, description = i
                if maligne == None:
                    print("Pas d'etat")
                else :   
                    
                    print(f"Utilisateur: {id_user}")
                    print(f"Titre: {titre}")   
                    print(f"Etat: {etat}")
                    print(f"Description: {description}")
                    
                    print("-------------------------------------------------------------------------------------------")

        elif choix=="3":
            Interface_User()
            break
            
        else:
            print("Inconnue")  
            
#========================================================================================================================    


def Connexion():
    global user_connecte
    while True:
        print("Bonjour Veuillez vous authentifiez")
        email=input("Donnez votre email: ").strip()
        password=input("donnez votre password: ").encode().strip()
        cursor=maconnexion.cursor()
        query="""Select id_user,nom,email,password,role from Utilisateurs where email=%s """
        cursor.execute(query,(email,))
        maligne=cursor.fetchone()
        
        if maligne is None :
            print("email incorrect")
        else:
        
            id_user,nom,email,passhash,role=maligne
            if bcrypt.checkpw(password , passhash.encode()):
                user_connecte=id_user
                print(f"Connexion reussie, Bonjour {nom}")
                
                print("-------------------------------------------------------------------------------------------")
                while True:
                    role=maligne[-1]
                    if role=='admin':
                        
                        print("-------------------------------------------------------------------------------------")
                        Fonctionnalites_Admin()  
                        break
                    elif role=='apprenant':
                        
                        Fonctionnalites_Apprenants()
                        break 
                break    
            else:
                print("Mot de passe incorrect")    
        cursor.close()          

#=========================================================================================================================

def Inscription():
    print("Bienvenue sur la plateforme d'insription de Helpdesk")
    
    
    while True:
        nom=input("Donnez votre nom: ").strip()
        if len(nom)>=3 and  nom.replace(" ", "").isalpha():
            break
        else:
            print("Le nom doit etre alphabetique et sa longueur superieur ou egale a 3 caracteres")
    while True:        
        email=input("Donnez votre adresse email: ").strip()
        if len(email)>=4 and "@" in email and "." in email and " " not in email:
            break
        else:
            print("saisir un email valide")
    while True:        
        password=input("Donnez votre mot de passe: ").encode()
        if len(password)>=3:
            passHashed=bcrypt.hashpw(password, bcrypt.gensalt(14))
            cursor=maconnexion.cursor()
            query="""INSERT INTO Utilisateurs(nom,email,password)values(%s,%s,%s)"""
            cursor.execute(query,(nom,email,passHashed))
            maconnexion.commit()
            print("Vous etes bien inscrit, Veuillez vous authentifier")
            Connexion()
            cursor.close()
            break
        else:
            print("La longueur du  mot de passe doit etre superieure ou egale a 3 caracteres")
        cursor.close() 
   
        
#==========================================================================================================================





def Interface_User():
    while True:

        print("Bienvenue sur Helpdesk, Connectez vous ou inscrivez vous si vous n'avez pas de compte")
        print("1- Connexion")
        print("2- Inscription")
        choix_interface=input("Donnez votre choix: ")
        if choix_interface=="1" :
            Connexion()
            break
        if choix_interface=="2":
            Inscription()
            break           

#==========================================================================================================================


def Menu_apprenant():

    print("1-Faire une demande")
    print("2-Suivre les etats de ses demandes")
    print("3-Se deconnecter")        


def Menu_admin():
   
    print("1-Voir la liste de tous les tickets")            
    print("2-Suivre les tickets")
    print("3-Se deconnecte")
    

def main():
   
    Interface_User()
   


main()    