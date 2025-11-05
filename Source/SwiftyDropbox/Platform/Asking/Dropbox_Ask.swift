//
//  Dropbox_Ask.swift
//  Pods-TestSwiftyDropbox_ActionExtension
//
//  Created by Aleksander Kozin on 5/11/25.
//

//import WandFoundation

extension Files {

    struct Folder: Asking {

        func ask<C>(context: C) {

            let wand = Core.to(context)

            let path: String = wand.get()!

            let client = C as? DropboxClientsManager ?? wand.get()
            let queue = C as? DispatchQueue ?? wand.get() ?? DispatchQueue(label: "MyCustomSerialQueue")

            client.files.listFolder(path: path).response(queue: queue) {
                wand.addIf($0)
                wand.addIf($1)
            }
        }

    }

}

extension Files {

    struct File {

    }

}

struct DropboxFolderTest {

    func test() {

        "/test/path/in/Dropbox/account" | { (folder: Dropbox.Folder) in

        }

        "/test/path/in/Dropbox/account" | .delete { (folder: Dropbox.File) in

        }

        Dropbox.File() | { (done: Dropbox.File) in

        }


    }

}
