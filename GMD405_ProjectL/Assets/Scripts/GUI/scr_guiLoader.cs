using UnityEngine;
using UnityEngine.SceneManagement;

public class scr_guiLoader : MonoBehaviour
{
    public TextAsset script;

    private void Awake()
    {
        
        SceneManager.LoadScene("sce_gui", LoadSceneMode.Additive);
        SceneManager.LoadScene("sce_Dialogue", LoadSceneMode.Additive);
    }

    // Start is called once before the first execution of Update after the MonoBehaviour is created
    void Start()
    {
        ScriptReader.instance.SetJSON(script);
    }

    // Update is called once per frame
    void Update()
    {
        
    }
}
