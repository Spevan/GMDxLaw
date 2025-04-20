using UnityEngine;

public class scr_sfxManager : MonoBehaviour
{
    public static scr_sfxManager instance { get; private set; }
    AudioSource sfxSource;
    public AudioClip sfxClip;
    public AudioClip[] sfxAudios;

    private void Awake()
    {
        if (instance == null)
        {
            instance = this;
        }
        else
        {
            Destroy(this);
        }
    }

    private void Start()
    {
        sfxSource = GetComponent<AudioSource>();
    }

    // Update is called once per frame
    void Update()
    {
        
    }

    public void PlaySFX(AudioClip audio)
    {
        sfxSource.clip = audio;
        sfxSource.Play();
    }

    public void PlaySFX(string clipName)
    {
        foreach(AudioClip clip in sfxAudios)
        {
            if(clip.name == clipName)
            {
                sfxSource.clip = clip;
                sfxSource.Play();
            }
        }
    }
}
