import { Controller } from "stimulus"
import axios from 'axios'


export default class extends Controller {
  static targets = [ "followButton", "bookmark" ]

  follow(event) {
    event.preventDefault()
    // console.log("hi")
    // this.clapCountTarget.innerHTML = 'David'
    let user = this.followButtonTarget.dataset.user
    let target = this.followButtonTarget
    axios.post(`/api/users/${user}/follow`)
      .then(function (response) {
        let status = response.data.status
        switch(status){
          case 'sign_in_first':
            alert('你必須先登入')
            break
          default:
            target.innerHTML = status
        }
      })
        .catch(function (error) {
            console.log(error)
      })
  }

  bookmark(event){
    event.preventDefault()
    // console.log("hi")
    // this.clapCountTarget.innerHTML = 'David'
    let link = event.currentTarget
    let slug = link.dataset.slug
    let icon = this.bookmarkTarget
    // let target = this.followButtonTarget
    axios.post(`/api/stories/${slug}/bookmark`)
      .then(function (response) {
        let status = response.data.status
        switch(status) {
          case 'sign_in_first':
            alert('你必須先登入')
            break
            case 'Bookmarked':
              icon.classList.add('fas')
              icon.classList.remove('far')
              break
            case 'Unbookmarked':
              icon.classList.add('far')
              icon.classList.remove('fas')
              break
        }
        // console.log(status)
      })
      .catch(function (error) {
        console.log(error)
      })

  }

}
